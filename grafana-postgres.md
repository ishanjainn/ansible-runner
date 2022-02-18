# Ship PostgreSQL logs to Grafana Cloud using Grafana Agent

## Prerequisites
Before you begin, you should have the following available:
* A Grafana Cloud account
* A Linux machine
* PostgreSQL installed on your machine
* Grafana Agent installed on your machine

Once you have these installed, you’re ready to begin with this guide

## Configure Grafana Cloud to receive the logs
To begin, Create a [Grafana Cloud API key](https://grafana.com/docs/grafana-cloud/reference/create-api-key/) with the **MetricsPublisher** role. Save this information as you will need the API key in a later step.

Open Grafana Cloud. In the side menu, from **Settings** (looks like a gear) select **Data Sources**.

On the **Configuration** page that opens, in the **Data Sources** tab (which you should already be in), click **Add data source**.

From the list of options, select **Loki**. Keep this open in a browser tab.

Open a different browser tab and open Grafana Cloud. In this tab:
1. In the side menu, from **Onboarding** (looks like a lightning bolt) select **Walkthrough**.
2. Find and select **Loki**, scroll down and click **Next: Configure service**.
3. Paste the **API Key** from previous step. Click **Finish configuration**.

Go back to the previous tab where we were configuring the Loki data source. Enter the information you found for **Name**, **URL**, **User**, the **API key** you created earlier, and check the **Basic Auth box**.

## Configure the agent to collect and send PostgreSQL logs
Since your Linux machine is already running the agent, configuring it to send logs along with whatever metrics it is already sending is accomplished by modifying the agent configuration YAML file.
 
The agent configuration is stored in `/etc/grafana-agent.yaml`. Open the file and add `logs` section, below the Prometheus section (if it exists) and the Integrations section 
(if it exists). Configuration for `logs` section has been defined below

```yaml
logs:
  configs:
    - name: default
      scrape_configs:
        - job_name: postgresql
          static_configs:
            - targets: [localhost:5432]
              labels:
                job: postgresql
                __path__: /var/log/postgresql/*log`
      clients:
        - basic_auth:
            password: <Your Grafana.com API Key>
            username: <User>
          url: https://<Loki URL in your Grafana Cloud>.grafana.net/api/prom/push
      positions:
        filename: /tmp/positions.yaml
      target_config:
        sync_period: 10s
```
This example will scrape and send info from all logs in `/var/log/postgresql` that end in `log`. They are labeled with `postgresql` as the job and job_name

Anytime you change the agent configuration, you **must** restart the agent for the new configuration to take effect.

```
sudo systemctl restart grafana-agent.service
```

## Check that logs are being ingested into Grafana Cloud
Within minutes, logs should begin to be available in Grafana Cloud. To test this, use the **Explore** feature. Click the Explore icon (looks like compass points) in the sidebar to start. This takes you to the Explore page, which looks like this.

At the top of the page, use the dropdown menu to select your Loki logs data source.
In the Log Browser, Run the query `{job="postgresql"}`

![Loki Explore Tab](https://drive.google.com/uc?export=view&id=1hOFkoSfsu8xPnFIEGkliwv_d_4UWCn2t)

If no log labels appear, logs are not being collected. If labels are listed, this confirms that logs are being received.

If logs are not displayed after several minutes, check your steps for typos and whether the agent is running on the Linux machine.

## Configure a dashboard with a panel displaying Postgres Logs

To add a panel to a dashboard:

* Navigate to the dashboard to which you want to add a panel and click the **Add panel** icon.

![img.png](https://grafana.com/static/img/docs/panels/add-panel-icon-7-0.png)
* To make this new panel display logs, click to expand the Visualization options on the right and click Logs to select it.
* Select Loki logs data source
* Enter this query into the Log labels box and then click anywhere outside of the box. The log entries should appear in the new panel example in the page.
```
`{job="postgresql"}`
```
* Here’s what the Edit Panel page should look like now.You can also click on the down arrow next to Log labels to explore the labels being received and create your own panels using other logs and so on.

![Edit Page for Log panel](https://drive.google.com/uc?export=view&id=1iIh_nr1t4QQsApVpDpDro5nqSfdEzd64)
* To finish creating the panel, click Apply at the top of the page.

![Log Panel](https://drive.google.com/uc?export=view&id=12Flw7SEOfJQ2sr1AX6S7Bfw-7zhIfbfQ)

The panel will be created at the top of the page and may not stretch across the page. Panels are movable and resizable using your cursor to drag and resize as you would a window on your computer’s desktop. Here’s what ours looks like after we resized and put it just below the first row of our dashboard.

## Conclusion
This guide demonstrates how to send PostgreSQL logs to the Grafana cloud. Go ahead and try it out and let us know what you think!

For further instrumentation, [Pipelines](https://grafana.com/docs/loki/latest/clients/promtail/pipelines/) can be used to transform log lines, labels and timestamps.

But first, you should put this setup to the test! Explore the PostgresSQL logs with Grafana and consider how they may be enhanced.
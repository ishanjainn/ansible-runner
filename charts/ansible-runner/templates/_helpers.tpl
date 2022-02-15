{{- define "argo-cd.defaultTag" -}}
  {{- default .Chart.AppVersion .Values.image.tag }}
{{- end -}}
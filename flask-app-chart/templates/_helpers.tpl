{{/*
Create a helper function to generate the full name for resources in this chart.
The full name includes the release name and the name of the resource.
*/}}
{{- define "flask-app-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

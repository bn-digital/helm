{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "app.labels" -}}
helm.sh/chart: {{ include "app.chart" . }}
{{ include "app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "app.podAnnotations" -}}
{{- if .Values.vcs.repository }}
{{ .Values.vcs.url }}/repository: {{ .Values.vcs.repository | quote }}
{{- end }}
{{- if .Values.vcs.commit }}
{{ .Values.vcs.url }}/commit: {{ .Values.vcs.commit | quote }}
{{- end }}
{{- if .Values.vcs.ref }}
{{ .Values.vcs.url }}/ref: {{ .Values.vcs.ref | quote }}
{{- end }}
{{- if .Values.podAnnotations }}
{{ toYaml .Values.podAnnotations }}
{{- end }}
{{- end }}

{{- define "app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.app.name }}
app.kubernetes.io/component: {{ default .Values.app.component .Values.image.repository | quote }}
app.kubernetes.io/environment: {{ .Values.app.environment | quote }}
{{- end }}

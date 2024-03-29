{{/*
Expand the name of the chart.
*/}}
{{- define "caddy.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-caddy" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-caddy" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "caddy.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-caddy" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name }}
{{- printf "%s-caddy" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s-caddy" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "caddy.chart" -}}
{{- printf "%s-caddy-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "caddy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "caddy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "caddy.labels" -}}
helm.sh/chart: {{ include "caddy.chart" . }}
{{ include "caddy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "elasticsearch.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-elasticsearch" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-elasticsearch" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "elasticsearch.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-elasticsearch" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-elasticsearch" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-elasticsearch" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "elasticsearch.chart" -}}
{{- printf "%s-elasticsearch-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "elasticsearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "elasticsearch.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "elasticsearch.labels" -}}
helm.sh/chart: {{ include "elasticsearch.chart" . }}
{{ include "elasticsearch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "mongodb.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-mongodb" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-mongodb" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mongodb.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-mongodb" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-mongodb" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-mongodb" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mongodb.chart" -}}
{{- printf "%s-mongodb-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mongodb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mongodb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mongodb.labels" -}}
helm.sh/chart: {{ include "mongodb.chart" . }}
{{ include "mongodb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "redis.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-redis" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-redis" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "redis.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-redis" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-redis" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-redis" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "redis.chart" -}}
{{- printf "%s-redis-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "redis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "redis.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "redis.labels" -}}
helm.sh/chart: {{ include "redis.chart" . }}
{{ include "redis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "mysql.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-mysql" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-mysql" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mysql.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-mysql" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-mysql" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-mysql" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mysql.chart" -}}
{{- printf "%s-mysql-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mysql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mysql.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mysql.labels" -}}
helm.sh/chart: {{ include "mysql.chart" . }}
{{ include "mysql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "clamav.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-clamav" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-clamav" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clamav.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-clamav" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-clamav" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-clamav" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "clamav.chart" -}}
{{- printf "%s-clamav-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "clamav.selectorLabels" -}}
app.kubernetes.io/name: {{ include "clamav.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "clamav.labels" -}}
helm.sh/chart: {{ include "clamav.chart" . }}
{{ include "clamav.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "forum.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-forum" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-forum" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "forum.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-forum" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-forum" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-forum" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "forum.chart" -}}
{{- printf "%s-forum-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "forum.selectorLabels" -}}
app.kubernetes.io/name: {{ include "forum.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "forum.labels" -}}
helm.sh/chart: {{ include "forum.chart" . }}
{{ include "forum.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "mfe.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-mfe" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-mfe" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mfe.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-mfe" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-mfe" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-mfe" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mfe.chart" -}}
{{- printf "%s-mfe-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mfe.labels" -}}
helm.sh/chart: {{ include "mfe.chart" . }}
{{ include "mfe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "openedx.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-openedx" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-openedx" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openedx.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-openedx" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-openedx" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-openedx" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openedx.chart" -}}
{{- printf "%s-%s-openedx" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openedx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openedx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openedx.labels" -}}
helm.sh/chart: {{ include "openedx.chart" . }}
{{ include "openedx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "cms.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-cms" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-cms" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cms.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-cms" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-cms" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-cms" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cms.chart" -}}
{{- printf "%s-cms-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cms.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cms.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cms.labels" -}}
helm.sh/chart: {{ include "cms.chart" . }}
{{ include "cms.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "cms-worker.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-cms-worker" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-cms-worker" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cms-worker.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-cms-worker" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-cms-worker" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-cms-worker" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cms-worker.chart" -}}
{{- printf "%s-cms-worker-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cms-worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cms-worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cms-worker.labels" -}}
helm.sh/chart: {{ include "cms-worker.chart" . }}
{{ include "cms-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "lms.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-lms" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-lms" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lms.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-lms" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-lms" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-lms" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lms.chart" -}}
{{- printf "%s-lms-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lms.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lms.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lms.labels" -}}
helm.sh/chart: {{ include "lms.chart" . }}
{{ include "lms.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "lms-worker.name" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-lms-worker" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-lms-worker" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lms-worker.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- printf "%s-lms-worker" .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride | trimSuffix "-" -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-lms-worker" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-lms-worker" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lms-worker.chart" -}}
{{- printf "%s-lms-worker-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lms-worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lms-worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lms-worker.labels" -}}
helm.sh/chart: {{ include "lms-worker.chart" . }}
{{ include "lms-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Create the name of the image to build
*/}}
{{- define "openedx.image" -}}
{{- if eq .Values.openedx.image.repository "azurecr.io" }}
{{- .Values.openedx.image.namespace }}.{{ .Values.openedx.image.repository }}/{{ .Values.openedx.image.name }}:{{ .Values.openedx.image.tag -}}
{{- else }}
{{- .Values.openedx.image.repository }}/{{ .Values.openedx.image.namespace | default .Release.Namespace }}/{{ .Values.openedx.image.name }}:{{ .Values.openedx.image.tag -}}
{{- end }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the LMS URL
*/}}
{{- define "lms.url" -}}
{{- if .Values.route.custom_host.enabled -}}
{{- .Values.route.custom_host.lms.name -}}
{{- else -}}
{{- include "lms.fullname" . -}}-{{ .Release.Namespace }}{{ .Values.openedx.env.cluster_base_url }}
{{- end -}}
{{- end -}}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the CMS URL
*/}}
{{- define "cms.url" -}}
{{- if .Values.route.custom_host.enabled -}}
{{- .Values.route.custom_host.cms.name -}}
{{- else -}}
{{- include "cms.fullname" . -}}-{{ .Release.Namespace }}{{ .Values.openedx.env.cluster_base_url }}
{{- end -}}
{{- end -}}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the MongoDB connection parameters JSON object.
*/}}
{{- define "mongodb.contentstore.parameters" -}}
{{- if .Values.mongodb.use_incluster_service }}
mongodb_parameters = {
    "db": "openedx",
    "host": "{{ .Release.Name }}-mongodb",
    "port": 27017,
    "user": None,
    "password": None,
    "replicaSet": None,
    "ssl": False,
    "authsource": "admin",
}
{{- else }}
mongodb_parameters = {
    "db": "{{ .Values.mongodb.managed.contentstore.db }}",
    "host": "{{ .Values.mongodb.managed.contentstore.host }}",
    "port": 27017,
    "user": "{{ .Values.mongodb.managed.contentstore.user }}",
    "password": "{{ .Values.mongodb.managed.contentstore.password }}",
    "replicaSet": "{{ .Values.mongodb.managed.contentstore.replicaSet }}",
    "ssl": True,
    "authsource": "admin",
}
{{- end }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the Redis connection string.
*/}}
{{- define "redis.connection.string" -}}
{{- if .Values.redis.use_incluster_service }}
"LOCATION": "redis://@{{ .Release.Name }}-redis:6379/1"
{{- else }}
"LOCATION": "redis://:{{ .Values.redis.managed.password }}@{{ .Values.redis.managed.host }}:{{ .Values.redis.managed.port }}/0"
{{- end }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the Celery Broker configuration.
*/}}
{{- define "celery.broker.configuration" -}}
{{- if .Values.redis.use_incluster_service }}
CELERY_BROKER_TRANSPORT: "redis"
CELERY_BROKER_HOSTNAME: "{{ .Release.Name }}-redis:6379"
CELERY_BROKER_VHOST: "0"
CELERY_BROKER_USER: ""
CELERY_BROKER_PASSWORD: ""
CELERY_BROKER_USE_SSL: False
{{- else }}
CELERY_BROKER_TRANSPORT: "redis"
CELERY_BROKER_HOSTNAME: "{{ .Values.redis.managed.host }}:{{ .Values.redis.managed.port }}"
CELERY_BROKER_VHOST: "0"
CELERY_BROKER_USER: ""
CELERY_BROKER_PASSWORD: "{{ .Values.redis.managed.password }}"
CELERY_BROKER_USE_SSL: False
{{- end }}
{{- end }}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the MySQL connection for Django
*/}}
{{- define "mysql.django.connection" -}}
{{ if .Values.mysql.use_incluster_service }}
ENGINE: "django.db.backends.mysql"
HOST: "{{ .Release.Name }}-mysql"
PORT: 3306
NAME: "{{ .Values.mysql.incluster.db_name }}"
USER: "{{ .Values.mysql.incluster.db_user }}"
PASSWORD: "{{ .Values.mysql.incluster.db_password }}"
ATOMIC_REQUESTS: true
OPTIONS:
  init_command: "SET sql_mode='STRICT_TRANS_TABLES'"
  charset: "utf8mb3"
{{ else }}
ENGINE: "django.db.backends.mysql"
HOST: "{{ .Values.mysql.managed.host }}"
PORT: 3306
NAME: "{{ .Values.mysql.managed.db_name }}"
USER: "{{ .Values.mysql.managed.db_user }}"
PASSWORD: "{{ .Values.mysql.managed.db_password }}"
ATOMIC_REQUESTS: true
OPTIONS:
  init_command: "SET sql_mode='STRICT_TRANS_TABLES'"
  charset: "utf8mb3"
{{ end }}
{{- end -}}

{{/*
---------------------------------------------------------------------------------------------------------
*/}}

{{/*
Generate the robots.txt
Please keep the same Indentation
*/}}
{{- define "robots.txt" -}}
respond /robots.txt 200 {
        body "User-agent: *
Disallow: /"
        }
{{- end -}}
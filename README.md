# avalanche

Avalanche serves a text-based [Prometheus metrics](https://prometheus.io/docs/instrumenting/exposition_formats/) endpoint for load testing [Prometheus](https://prometheus.io/) and possibly other [OpenMetrics](https://github.com/OpenObservability/OpenMetrics) consumers.

Avalanche also supports load testing for services accepting data via Prometheus remote_write API such as [Thanos](https://github.com/improbable-eng/thanos), [Cortex](https://github.com/weaveworks/cortex), [M3DB](https://m3db.github.io/m3/integrations/prometheus/), [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics/) and other services [listed here](https://prometheus.io/docs/operating/integrations/#remote-endpoints-and-storage).

Metric names and unique series change over time to simulate series churn.

Checkout the [blog post](https://blog.freshtracks.io/load-testing-prometheus-metric-ingestion-5b878711711c).

## configuration flags 
```bash 
avalanche --help
```

## run Docker image

```bash
docker run quay.io/freshtracks.io/avalanche --help
```

## Endpoints

Two endpoints are available :
* `/metrics` - metrics endpoint
* `/health` - healthcheck endpoint

## build and run go binary
```bash
go get github.com/open-fresh/avalanche/cmd/...
avalanche --help
```
## configuration

#### metric-count

Configure the number of metric names exposed in the endpoint. This option is useful for testing how the number of series present on the endpoint impacts ingestor performance.

#### series-count

Configure the number of series per-metric. The total number of series rendered to the endpoint is equal to (metric-count * series-count). This option is useful for testing how the (metric-count/series-count) ratio impacts ingestor performance.

#### label-count

Configure the number of labels present in each series.

#### value-interval

Update series values every {interval} seconds.

#### series-interval

Update the ‘series_id’ label every {interval} seconds, cycling series. This option is helpful for testing series creation and termination performance.

#### metric-interval

Update metric names every {interval} seconds, cycling series. This option is helpful for testing series creation and termination performance.

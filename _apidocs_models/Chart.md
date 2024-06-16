---
title: Chart
---



A generic chart. For specific implementations, see:

* [BarChart](#barchart)
* [HeatMapChart](#heatmapchart)
* [LineChart](#linechart)
* [MapChart](#mapchart)
* [PieChart](#piechart)

Note that this is an interface; the fields below are all possible fields for its children.


| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **title** | String | Title of the chart | [required]  |
| **width** | Integer | Width of the chart | [optional]  |
| **height** | Integer | Height of the chart | [optional]  |
| **type** | ChartType |  | [required]  |
| **data** | List&lt;Tuple&gt; | Contents of the chart | [required]  |
| **xAxisLabel** | String | Label for the x axis | [optional]  |
| **yAxisLabel** | String | Label for the y axis | [optional]  |
| **region** | String | Geographic region of the chart | [required]  |
| **colorAxis** | Integer | Color axis for the chart | [optional]  |
| **displayMode** | String | Display mode for the chart | [optional]  |
| **markerType** | String | Hint for the point marker types | [optional]  |

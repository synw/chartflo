# Chartflo

Tired of the boilerplate? Chartflo is a wrapper around different charting libraries to make the Flutter developer's life easier. Features:

- **Easy**: simple api, no learning curve
- **Simple**: minimal code and abstraction complexity

## Timeseries

### Simple chart

   ```dart
   final dataset = <DateTime,num>{someDate1: 5, someDate2: 8 /* ... */};
   Widget chart = TimeSerieChart(dataset: dataset);
   ```

![Simple chart](img/simple.png)

### Options

   ```dart
   Container(
      height: 200.0,
      color: Colors.black,
      child: Widget chart = TimeSerieChart(
         dataset: dataset,
         lineColor: Colors.red,
         textColor: Colors.white,
         axisColor: Colors.white,
         showPoints: true,
         showLine: false,
         fontSize: 18));
   ```

![Chart with options](img/options.png)

### Resample data

The timeseries can be grouped by time periods prior to charting: example:

   ```dart
   Widget chart = TimeSerieChart(
      dataset: dataset,
      showPoints: true,
      showArea: true,
      resample: Resample(
         timePeriod: const Duration(days: 1))
   );
   ```

This will group and mean the data by one day. Check the example for more details

## Todo

- [ ] Bezier line timeserie
- [ ] Bar charts
- [ ] Manage interactivity

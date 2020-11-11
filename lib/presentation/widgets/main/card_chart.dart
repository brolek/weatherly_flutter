import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mp_chart/mp/chart/line_chart.dart';
import 'package:mp_chart/mp/controller/line_chart_controller.dart';
import 'package:mp_chart/mp/core/data/line_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_line_data_set.dart';
import 'package:mp_chart/mp/core/data_set/line_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/enums/mode.dart';
import 'package:mp_chart/mp/core/value_formatter/value_formatter.dart';
import 'package:mp_chart/mp/core/view_port.dart';
import 'package:weatherly_flutter/data/model/hourly.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';
import 'package:weatherly_flutter/utils/extensions/extended_card.dart';
import 'package:weatherly_flutter/utils/weatherly_constants.dart';

class CardChart extends StatefulWidget {
  final List<Hourly> data;

  const CardChart({Key key, this.data}) : super(key: key);

  @override
  _CardChartState createState() => _CardChartState();
}

class _CardChartState extends State<CardChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(top: 8),
            height: 200,
            child: _initLineChart(widget.data))
        .wrapWithCard(kColorLightGrey);
  }

  LineChartController _initController() {
    LineChartController controller;

    var viewPort = ViewPortHandler()
      ..setMinimumScaleX(SCALE_X)
      ..setMaximumScaleX(SCALE_X)
      ..setMaximumScaleY(SCALE_Y);

    var desc = Description()..enabled = false;
    controller = LineChartController(
        axisLeftSettingFunction: (axisLeft, controller) {
          axisLeft.enabled = false;
        },
        axisRightSettingFunction: (axisRight, controller) {
          axisRight.enabled = false;
        },
        legendSettingFunction: (legend, controller) {
          legend.enabled = false;
        },
        xAxisSettingFunction: (xAxis, controller) {
          xAxis
            ..axisValueFormatter = XAxisValueFormatter()
            ..drawGridLines = false
            ..drawAxisLine = false;
        },
        drawGridBackground: false,
        backgroundColor: kColorLightGrey,
        dragXEnabled: true,
        dragYEnabled: false,
        autoScaleMinMaxEnabled: false,
        scaleXEnabled: false,
        scaleYEnabled: false,
        pinchZoomEnabled: false,
        customViewPortEnabled: true,
        description: desc)
      ..viewPortHandler = viewPort;

    return controller;
  }

  LineData _initLineData(List<Hourly> data) {
    List<Entry> entries = List();

    data.forEach((element) {
      entries.add(Entry(
          x: element.dt / HOUR_IN_SECONDS, y: element.temp.toInt().toDouble()));
    });

    LineDataSet dataSet = LineDataSet(entries, "")
      ..setDrawIcons(false)
      ..setColor1(kColorBlack)
      ..setLineWidth(1.5)
      ..setDrawCircleHole(false)
      ..setDrawCircles(false)
      ..setValueTextSize(14)
      ..setValueFormatter(LineValueFormatter())
      ..setDrawFilled(true)
      ..setHighlightEnabled(false)
      ..setDrawHighlightIndicators(false)
      ..setMode(Mode.HORIZONTAL_BEZIER)
      ..setGradientColor(kColorPrimary, kColorPrimary);

    List<ILineDataSet> dataSets = List();
    dataSets.add(dataSet);

    return LineData.fromList(dataSets);
  }

  Widget _initLineChart(List<Hourly> data) {
    LineChartController controller = _initController();
    controller.data = _initLineData(data);
    return LineChart(controller);
  }
}

class LineValueFormatter extends ValueFormatter {
  @override
  String getFormattedValue1(double value) {
    return value.toInt().toString() + "°";
  }
}

class XAxisValueFormatter extends ValueFormatter {
  final hourFormat = DateFormat('HH');
  final dayMonthHourFormat = DateFormat('dd MMM HH');

  @override
  String getFormattedValue1(double value) {
    int millis = value.toInt() * 1000 * HOUR_IN_SECONDS;
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
    if (date.hour == 0) {
      return dayMonthHourFormat.format(date);
    } else {
      return hourFormat.format(date);
    }
  }
}

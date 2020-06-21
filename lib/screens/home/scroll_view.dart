import 'package:eh_redux/screens/home/store.dart';
import 'package:eh_redux/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScrollView extends StatefulWidget {
  const HomeScrollView({
    Key key,
    @required this.headerSliverBuilder,
    @required this.body,
  })  : assert(headerSliverBuilder != null),
        assert(body != null),
        super(key: key);

  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;
  final Widget body;

  @override
  _HomeScrollViewState createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context);

    return StatefulWrapper(
      onInit: (context) {
        return reaction((_) => homeStore.bottomNavClickedAt, (_) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
          );
        });
      },
      builder: (context) {
        return NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: widget.headerSliverBuilder,
          body: widget.body,
        );
      },
    );
  }
}

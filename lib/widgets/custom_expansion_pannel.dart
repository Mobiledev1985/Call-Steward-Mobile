import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:call_steward/widgets/space_vertical.dart';
import 'package:call_steward/constants/colorpalette.dart';

class CustomExpansionPanel extends StatefulWidget {
  const CustomExpansionPanel({
    Key? key,
    required this.header,
    required this.body,
    this.isOpenDefault = false,
    this.isFromShcedule = false,
    this.onTap,
    this.onJobCall,
    this.customIcon,
    this.onIconTap,
  }) : super(key: key);

  final Widget header;
  final Widget body;
  final bool isOpenDefault;
  final bool isFromShcedule;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onJobCall;
  final IconData? customIcon;
  final GestureTapCallback? onIconTap;

  @override
  State<CustomExpansionPanel> createState() => _CustomExpansionPanelState();
}

class _CustomExpansionPanelState extends State<CustomExpansionPanel>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    if (widget.isOpenDefault) {
      _toggleExpanded();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            ColorPalette.white,
            ColorPalette.gradientColor,
          ],
          stops: [
            0.0,
            1.0,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!.call();
              }
              _toggleExpanded.call();
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: !_isExpanded ? 16 : 0,
              ),
              child: Row(
                children: [
                  Expanded(child: widget.header),
                  widget.customIcon == null
                      ? Column(
                          children: [
                            if (widget.onJobCall != null &&
                                widget.isFromShcedule) ...[
                              InkWell(
                                onTap: widget.onJobCall,
                                child: CircleAvatar(
                                  backgroundColor: ColorPalette.blackText,
                                  radius: 12.5,
                                  child: CircleAvatar(
                                    backgroundColor: ColorPalette.white,
                                    radius: 12,
                                    child: Text(
                                      'C',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SpaceVertical(35),
                            ],
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: ColorPalette.blue,
                              child: RotationTransition(
                                turns: Tween(begin: 0.0, end: 0.5)
                                    .animate(_controller),
                                child: const Icon(
                                  Icons.expand_more,
                                  color: ColorPalette.white,
                                ),
                              ),
                            )
                          ],
                        )
                      : InkWell(
                          onTap: widget.onIconTap,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              widget.customIcon,
                              size: 14,
                              color: const Color(0xff337ab7),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: widget.body,
            ),
          ),
        ],
      ),
    );
  }
}

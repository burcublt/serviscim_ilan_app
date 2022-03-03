import 'package:flutter/material.dart';

class ProjectInputs extends InputDecoration {
  const ProjectInputs(String title)
      : super(
          hintText: title,
          hintStyle: const TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.only(left: 10.0),
          border: const OutlineInputBorder(),
        );
}

class ProjectInputsUnderline extends InputDecoration {
  const ProjectInputsUnderline(title)
      : super(
          hintText: title,
          hintStyle: const TextStyle(
            fontFamily: 'MetropolisRegular',
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.only(left: 10.0),
          border: InputBorder.none,
        );
}

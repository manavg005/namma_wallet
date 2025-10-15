import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Service for managing haptic feedback across the app
/// Provides consistent haptic feedback for different interaction types
class HapticService {
  HapticService._();

  /// Light impact feedback for subtle interactions
  /// Use for: Navigation, selection changes, minor UI updates
  static Future<void> light() async {
    if (kDebugMode) {
      print('🔹 Haptic: light()');
    }
    try {
      if (Platform.isAndroid) {
        // On Android, use vibrate for more noticeable feedback
        await HapticFeedback.vibrate();
      } else {
        await HapticFeedback.selectionClick();
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Haptic error: $e');
      }
    }
  }

  /// Medium impact feedback for standard interactions
  /// Use for: Button presses, card taps, confirmations
  static Future<void> medium() async {
    if (kDebugMode) {
      print('🔸 Haptic: medium()');
    }
    try {
      if (Platform.isAndroid) {
        // On Android, vibrate is more reliable than mediumImpact
        await HapticFeedback.vibrate();
      } else {
        await HapticFeedback.mediumImpact();
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Haptic error: $e');
      }
    }
  }

  /// Heavy impact feedback for significant interactions
  /// Use for: Deletions, important actions, alerts
  static Future<void> heavy() async {
    if (kDebugMode) {
      print('🔶 Haptic: heavy()');
    }
    try {
      if (Platform.isAndroid) {
        // On Android, use double vibrate for heavy feedback
        await HapticFeedback.vibrate();
        await Future<void>.delayed(const Duration(milliseconds: 50));
        await HapticFeedback.vibrate();
      } else {
        await HapticFeedback.heavyImpact();
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Haptic error: $e');
      }
    }
  }

  /// Light vibration for continuous gestures
  /// Use for: Drag operations, swipes, scrolling boundaries
  static Future<void> vibrate() async {
    if (kDebugMode) {
      print('📳 Haptic: vibrate()');
    }
    try {
      await HapticFeedback.vibrate();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Haptic error: $e');
      }
    }
  }

  /// Selection click for tab/option changes
  /// Use for: Tab switching, option selection, toggles
  static Future<void> selection() async {
    if (kDebugMode) {
      print('✨ Haptic: selection()');
    }
    try {
      if (Platform.isAndroid) {
        // On Android, use vibrate for more noticeable feedback
        await HapticFeedback.vibrate();
      } else {
        await HapticFeedback.selectionClick();
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Haptic error: $e');
      }
    }
  }
}

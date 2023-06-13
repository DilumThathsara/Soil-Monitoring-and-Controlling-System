import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/l10n/l10n.dart';
import 'package:soil_app/providers/home/local_provider.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 134, 166, 93),
        radius: 72,
        child: Text(
          flag,
          style: const TextStyle(
              fontSize: 80, color: Color.fromARGB(255, 134, 166, 93)),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? const Locale('en');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);

            return DropdownMenuItem(
              value: locale,
              onTap: () {
                print(locale);

                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);

                print(Localizations.localeOf(context));
              },
              child: Center(
                child: Text(
                  flag,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

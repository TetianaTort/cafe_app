import 'package:cafe_app/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AccauntScreen extends StatefulWidget {
  const AccauntScreen({super.key});

  static const int discount = 5;
  static const int cardNo = 512213204324;
  static const String name = 'Tetiana';

  @override
  State<AccauntScreen> createState() => _AccauntScreenState();
}

class _AccauntScreenState extends State<AccauntScreen> {
  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context)!;
    var selectedLocale = Localizations.localeOf(context).toString();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 40),
              Column(
                children: [
                  Text(
                    AccauntScreen.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${translate.discountAmount} ${AccauntScreen.discount}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            translate.cardNo,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            AccauntScreen.cardNo.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(child: Divider()),
              Text(
                translate.settings,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Expanded(
                child: Divider(),
              ),
            ],
          ),
          // todo bloc with language + light dark mode
          Consumer<SettingsModel>(
            builder: (context, settingsModel, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translate.lightDarkMode,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Switch.adaptive(
                      value: settingsModel.isLightTheme,
                      onChanged: (value) {
                        settingsModel.changeTheme(value);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    DropdownButton(
                      value: selectedLocale,
                      items: [
                        DropdownMenuItem(
                          value: "en",
                          child: Text(translate.pageSettingsInputLanguage("en")),
                        ),
                        DropdownMenuItem(
                          value: "uk",
                          child: Text(translate.pageSettingsInputLanguage("uk")),
                        )
                      ],
                      onChanged: (String? value) {
                        if (value != null) {
                          settingsModel.set(Locale(value));
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

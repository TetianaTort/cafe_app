import 'package:cafe_app/model/settings.dart';
import 'package:cafe_app/utils/data_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AccauntScreen extends StatefulWidget {
  const AccauntScreen({super.key});

  @override
  State<AccauntScreen> createState() => _AccauntScreenState();
}

class _AccauntScreenState extends State<AccauntScreen> {
  void changeTheme(BuildContext buildContext, bool value) {
    CustomTheme.instanceOf(buildContext)?.changeTheme(value);
  }

  bool? currentTheme(BuildContext buildContext) {
    return CustomTheme.instanceOf(context)?.isLight();
  }

  @override
  Widget build(BuildContext context) {
    const int discount = 5;
    const int cardNo = 512213204324;
    const String name = 'Tetiana';
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
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${translate.discountAmount} $discount%',
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
            cardNo.toString(),
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
                      value: currentTheme(context)!,
                      onChanged: (value) {
                        changeTheme(context, value);
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

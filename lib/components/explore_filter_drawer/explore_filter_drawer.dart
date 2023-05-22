import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/filters.dart';
import 'package:flutter_projet_4a/services/utils.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class ExploreFilterDrawer extends StatefulWidget {
  const ExploreFilterDrawer({super.key});

  @override
  State<ExploreFilterDrawer> createState() => _ExploreFilterDrawerState();
}

class _ExploreFilterDrawerState extends State<ExploreFilterDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Filters>(builder: (context, filters, child) {
      return Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DrawerHeader(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Filters",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select types"),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Wrap(spacing: 5, children: [
                            for (var type in MangaType.values)
                              RawChip(
                                selectedColor:
                                    Theme.of(context).colorScheme.secondary,
                                label: Text(type.toString().split(".")[1],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                selected: filters.selectedType == type,
                                onSelected: (value) {
                                  if (value) {
                                    filters.setType(type);
                                  } else {
                                    filters.setType(null);
                                  }
                                },
                              ),
                          ]),
                        ),
                      ),
                      Text("Select genres"),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Wrap(spacing: 5, children: [
                            for (var genre in MangaGenres.values)
                              RawChip(
                                selectedColor:
                                    Theme.of(context).colorScheme.secondary,
                                label: Text(genre.toString().split(".")[1],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                selected:
                                    filters.selectedGenres.contains(genre),
                                onSelected: (value) {
                                  filters.setGenre(genre);
                                },
                              ),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                        onPressed: () => Scaffold.of(context).closeDrawer(),
                        icon: Icon(Icons.close),
                        label: Text("Close filters")),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

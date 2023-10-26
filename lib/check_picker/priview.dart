import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePage extends StatefulWidget {
  final List<PlatformFile>files;
  final ValueChanged<PlatformFile>onOpenedFile;
  const FilePage({Key? key,required this.files,required this.onOpenedFile}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
          ),
          itemCount: widget.files.length,
          itemBuilder: (context,index){
            final file=widget.files[index];
            return  Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container(alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey

                    ),
                    // child: Text('.$extension'),
                  )
                  ),
                  Text(file.name),
                  // Text(fileSize)

                ],
              ),
            );
          },
        ),
      ),
    );

  }

  Widget buildFile(PlatformFile file){
    // final kb = file.size / 1024;
    // final mb = kb / 1024;
    // final fileSize=mb>=1?'${mb.toStringAsFixed(2)}MB':'${kb.toString()}';
    // final extension=file.extension??'none';
    // final color=getColor(extension);
    return InkWell(
      onTap: ()=>widget.onOpenedFile(file),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey

            ),
              // child: Text('.$extension'),
            )
            ),
            Text(file.name),
            // Text(fileSize)

          ],
        ),
      ),
    );
  }
}

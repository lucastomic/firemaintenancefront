import 'package:flutter_dotenv/flutter_dotenv.dart';

late String serverURL;
late String title;
late String cloudinaryUploadPreset;
late String cloudinaryCloudName;

Future<void> loadEnviroments()async{
  await dotenv.load(fileName: ".env");
  serverURL = dotenv.env["BACKEND_URL"]!;
  title = dotenv.env["APP_TITLE"]!;
  cloudinaryUploadPreset = dotenv.env["CLOUDINARY_UPLOAD_PRESET"]!;
  cloudinaryCloudName = dotenv.env["CLOUDINARY_CLOUD_NAME"]!;
}

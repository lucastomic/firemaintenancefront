import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:injectable/injectable.dart';

import '../../config/environment.dart';
import 'image_uploader_port.dart';

@Injectable(as:ImageUploader)
class CloudinaryImageUploader implements ImageUploader{
  late final CloudinaryPublic _cloudinary;

  CloudinaryImageUploader(){
    _initializeConfig();
  }

  @override
  Future<String> uploadImage(String imagePath)async{ 
    CloudinaryResponse response = await _uploadImage(imagePath);
    return response.secureUrl;
  }

  void _initializeConfig(){
    _cloudinary = CloudinaryPublic(cloudinaryCloudName, cloudinaryUploadPreset, cache: false);
  }

  Future<CloudinaryResponse> _uploadImage(String imagePath)async{
    return await _cloudinary.uploadFile(
      CloudinaryFile.fromFile(imagePath)
    );
  }
}
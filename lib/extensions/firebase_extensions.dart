import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:martideas/models/ideas_model/ideas_like_model.dart';

import '../api_routes/firebase_api_route.dart';
import '../models/ideas_model/create_ideas_model.dart';

extension AuthFirebaseFirestoreExtentsion on FirebaseFirestore {
  CollectionReference<CreateIdeaModel> ideasCollectionRef()=>
      collection(FirebaseApiRoute.IDEAS_COLLECTION).withConverter<CreateIdeaModel>(fromFirestore: (snapshots,_)=>CreateIdeaModel.fromJson(snapshots.data()!), toFirestore: (ideasModel,_)=>ideasModel.toJson());
  CollectionReference<IdeasLikeModel> ideasLikeCollectionRef(String docId)=>
      collection(FirebaseApiRoute.IDEAS_COLLECTION).doc(docId).collection(FirebaseApiRoute.IDEAS_LIKE_COLLECTION).withConverter<IdeasLikeModel>(fromFirestore: (snapshots,_)=>IdeasLikeModel.fromJson(snapshots.data()!), toFirestore: (ideasModel,_)=>ideasModel.toJson());


}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final fbAuth = FirebaseAuth.instance.currentUser;
final FirebaseFirestore fs = FirebaseFirestore.instance;

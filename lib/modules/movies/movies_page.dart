import 'package:flutter/material.dart';
    
class MoviesPage extends StatelessWidget {

  const MoviesPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: Text('Movie Page'),
     ),
     body: Text('Estou na MoviesPage'),
    );
  }
}
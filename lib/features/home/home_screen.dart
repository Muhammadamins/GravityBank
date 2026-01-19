import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gravitybank/features/auth/bloc/auth_bloc.dart';
import 'package:gravitybank/features/auth/bloc/auth_state.dart';
import 'package:gravitybank/features/auth/screens/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hello 👋',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(backgroundColor: Colors.grey, radius: 22),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Balance Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff4FACFE), Color(0xff00F2FE)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Your Balance', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 10),
                  Text(
                    '\$12,450.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ActionButton(icon: Icons.send, title: 'Send', onTap: () {}),
                  _ActionButton(
                    icon: Icons.call_received,
                    title: 'Receive',
                    onTap: () {},
                  ),
                  _ActionButton(
                    icon: Icons.credit_card,
                    title: 'Cards',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 26),
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

void _secureAction(BuildContext context, String route) {
  final authState = context.read<AuthBloc>().state;

  if (authState is AuthAuthenticated) {
    Navigator.pushNamed(context, route);
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen(redirectTo: route)),
    );
  }
}

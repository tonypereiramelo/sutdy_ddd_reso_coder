import 'package:another_flushbar/flushbar_helper.dart';
import 'package:ddd_study/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => 'cancelledByUser',
                  serverError: (_) => 'serverError',
                  emailAlreadyInUse: (_) => 'emailAlreadyInUse',
                  invalidEmailAndPassworCombination: (_) =>
                      'invalidEmailAndPassworCombination',
                ),
              ).show(context)
            },
            (_) => null,
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                '📝',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelText: 'Email'),
                autocorrect: false,
                onChanged: (value) => context.read<SignInFormBloc>().add(
                      SignInFormEvent.emailChange(value),
                    ),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.emailAddress.isValid()
                        ? null
                        : 'Invalid Email',
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                    ),
                    labelText: 'Password'),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => context.read<SignInFormBloc>().add(
                      SignInFormEvent.passwordChange(value),
                    ),
                validator: (_) =>
                    context.read<SignInFormBloc>().state.password.isValid()
                        ? null
                        : 'Short Password',
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SignInFormBloc>().add(
                        const SignInFormEvent.signInWithGooglePressed(),
                      );
                },
                child: const Text('SIGN IN WITH GOOGLE'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (state.inSubmitting) ...[
                const SizedBox(
                  height: 8,
                ),
                const LinearProgressIndicator(
                  value: null,
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}

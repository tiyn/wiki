# Rocq

[Rocq](https://rocq-prover.org/) is an interactive theorem prover.
It was formerly known as Coq.

## Setup

Rocq can be installed as explained on [the official website](https://rocq-prover.org/install).

The easiest way to install Rocq is by using Opam due to it also being able to manage packages for
Rocq.
Opam needs to be installed for this.
On most [Linux-based Systems](/wiki/linux.md) the [package manager](/wiki/linux/package_manager.md)
contains a package called `opam`.
If Opam was not initialized before, do it using the following commands.
The command may ask to edit the config file for the shell.
This is needed to function correctly.

```sh
opam init
eval $(opam env)
```

Then Rocq can be installed using the following command.
`<version>` has to be set to the desired version to install (for example `9.0.0`).

```sh
opam pin add rocq-prover <version>
```

## Usage

This section addresses the usage of Rocq.

### Basic Usage

Rocq proves are saved in `.v` files.
These can be compiled using the following command where `<file>` is a Rocq proof file.

```sh 
rocq c <file>
```

If nothing is shown as output and files like a `.vo` file are generated the proof was successful.
Otherwise it was not successful.

### Examples

The following example proofs can be used to confirm the [Rocq setup](#setup) to work correctly.

The following is a simple proof for commutativity of addition.
This proof is correct.

```v 
Theorem plus_comm : forall n m : nat, n + m = m + n.
Proof.
  intros n m.
  induction n as [| n' IH].
  - simpl. rewrite <- plus_n_O. reflexivity.
  - simpl. rewrite IH. rewrite <- plus_n_Sm. reflexivity.
Qed.
```

The following proof attempts to proof that all natural numbers are equal to zero which is obviously
false.

```v 
Theorem all_zero : forall n : nat, n = 0.
Proof.
  intros n.
  destruct n.
  - reflexivity.
  - reflexivity.
Qed.
```

class SingletonI {
  SingletonI._();

  static SingletonI? instance;

  static SingletonI? anyone() {
    if (instance == null) {
      instance = SingletonI._();
    }
    return instance;
  }
}

void main() {
  SingletonI? a = SingletonI.anyone();
  SingletonI? b = SingletonI.anyone();

  if (a == b) {
    print("they are equal");
  } else {
    return print("they are not equal");
  }
}

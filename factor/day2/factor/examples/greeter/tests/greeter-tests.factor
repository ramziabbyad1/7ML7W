USING: examples.greeter tools.test ;
IN: examples.greeter.tests

{ "Hello, Test" } [ "Test" greeting ] unit-test

{ "Hello world" } [ "world" greeting ] unit-test

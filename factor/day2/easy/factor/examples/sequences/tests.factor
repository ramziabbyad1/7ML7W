USING: tools.test examples.sequences kernel ;
IN: examples.sequences

{ "b" } [ { "p" "m" "b" } [ "b" = ]  find-first ] unit-test
{ "b" } [ { "p" "m" "b" } [ "b" = ]  find-first-2 ] unit-test
! { "m" } [ { "p" "m" "b" } [ "m" = ]  find-first ] unit-test
! { "m" } [ { "p" "m" "b" } [ "l" = ]  find-first-2 ] unit-test

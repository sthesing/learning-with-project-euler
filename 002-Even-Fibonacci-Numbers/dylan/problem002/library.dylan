Module: dylan-user

define library problem002
  use common-dylan;
  use io;
end library;

define module problem002
  use common-dylan, exclude: { format-to-string };
  use format-out;
end module;

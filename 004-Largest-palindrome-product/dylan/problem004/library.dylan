Module: dylan-user

define library problem004
  use common-dylan;
  use io;
end library;

define module problem004
  use common-dylan, exclude: { format-to-string };
  use format-out;
end module;

Module: dylan-user

define library problem003
  use common-dylan;
  use io;
end library;

define module problem003
  use common-dylan, exclude: { format-to-string };
  use format-out;
end module;

Module: dylan-user

define library problem005
  use common-dylan;
  use io;
end library;

define module problem005
  use common-dylan, exclude: { format-to-string };
  use format-out;
end module;

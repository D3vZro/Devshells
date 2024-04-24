{
  description = "A collection of devshells";

  outputs = { self }: {
    templates.basic = {
      path = ./basic;
      description = "A basic devshell";
    };

    defaultTemplate = self.templates.basic;
  };
}

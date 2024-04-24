{
  description = "A collection of devshells";

  outputs = { self }: {
    templates.basic = {
      path = ./basic;
      description = "A basic devshell";
    };

    templates.latex = {
      path = ./latex;
      description = "A devshell for editing and compiling LaTeX documents";
    };

    defaultTemplate = self.templates.basic;
  };
}

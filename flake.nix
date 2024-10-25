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

    templates.scala = {
      path = ./scala;
      description = "A devshell for scala projects";
    };

    templates.cpp = {
      path = ./cpp;
      description = "A devshell for C++ projects with OpenMP & CUDA";
    };

    defaultTemplate = self.templates.basic;
  };
}

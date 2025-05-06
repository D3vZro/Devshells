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

    templates.lean= {
      path = ./lean;
      description = "A devshell for Lean projects";
    };

    templates.scala = {
      path = ./scala;
      description = "A devshell for Scala projects";
    };

    templates.cpp = {
      path = ./cpp;
      description = "A devshell for C++ projects with OpenMP & CUDA";
    };

    templates.svelte = {
      path = ./svelte;
      description = "A devshell for Svelte & TailwindCSS";
    };

    defaultTemplate = self.templates.basic;
  };
}

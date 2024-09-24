# INTERSECT Architecture Documentation

The open Interconnected Science Ecosystem (INTERSECT) architecture connects
scientific instruments and robot-controlled laboratories with computing and
data resources at the edge, the Cloud or the high-performance computing center
to enable autonomous experiments, self-driving laboratories, smart
manufacturing, and artificial intelligence driven design, discovery and
evaluation. Its a novel approach consists of science use case design patterns,
a system of systems architecture, and a microservice architecture.

The INTERSECT architecture documentation is written in
[ReStructured Text (RST)](https://www.sphinx-doc.org/en/master/usage/restructuredtext/)
format and uses [Sphinx](https://www.sphinx-doc.org/) to generate the
[Web-based documentation](https://intersect-architecture.readthedocs.io).



##  Building Docs Manually

 - Step 1: **FIRST TIME ONLY**

   ```
   shell$ python3 -m venv ve3
   shell$ source ve3/bin/activate
   shell$ pip install -r requirements.txt
   ```

 - Step 2: Standard usage for edit and build

   ```
   shell$ source ve3/bin/activate
   shell$ make
   shell$ vi myfile.rst
   shell$ make
   ```
   
 - Step 3: View HTML results (e.g., using ``open`` utility on macOS)

   ```
   shell$ open _build/index.html
   ```


## Acknowledgements

Research sponsored by the [Laboratory Directed Research and Development
Program's INTERSECT Initiative](https://www.ornl.gov/intersect) of [Oak Ridge
National Laboratory](https://www.ornl.gov).


## How to Cite

Christian Engelmann,
Michael Brim,
Swen Boehm,
Olga Kuchar,
Jack Lange,
Thomas Naughton,
Patrick Widener,
Ben Mintz,
Rob Moore,
Elke Arenholz,
Scott Atchley,
Suhas Somnath, and
Rohit Srivastava.
INTERSECT Architecture Documentation.
URL: https://intersect-architecture.readthedocs.io


## Contact

Please contact Christian Engelmann at engelmannc@ornl.gov with any comments or
questions.

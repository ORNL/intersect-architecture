
ARGS = -noerror #-nbthread auto
PLANTUML = plantuml ${ARGS}

MASTER_SOURCE = intersect-erd.plantuml
SOURCES = $(wildcard *.plantuml)
OUTPUTS = intersect-erd.png intersect-erd.pdf

all : png

png : intersect-erd.png 
intersect-erd.png : ${SOURCES}
	${PLANTUML} ${MASTER_SOURCE}

pdf : intersect-erd.pdf
intersect-erd.pdf : intersect-erd.png
	convert intersect-erd.png intersect-erd.pdf

copyout : pdf
	cp intersect-erd.pdf ../er-model/

dryrun :
	${PLANTUML} -checkonly ${MASTER_SOURCE}

clean :
	rm -f ${OUTPUTS}


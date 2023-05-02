   /*
          Material(
            elevation: 5,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Container(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                alignment: Alignment.topCenter,
                width: 340,
                height: 500,
                child: Column(
                  children: [
                    Text(
                      "Evento:  TICS en la Sociedad",
                      style: TextStyle(
                        color: HexColor("#240774"),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Actividad:  Nombre Actividad",
                      style: TextStyle(
                        color: HexColor("#240774"),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 0, 35, 233),
                          width: 1,
                        ),
                      ),
                      child: const TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Escribe aquí tu comentario',
                        ),
                        cursorHeight: 20,
                        clipBehavior: Clip.antiAlias,
                        autofocus: true,
                        maxLines: null,
                      ),
                    ),
                  ],
                )),
          ),

          //ContenedorComentarios()
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: HexColor("#240774"),
                padding: const EdgeInsets.all(20),
                onPressed: () => {
                  print("Boton comentario"),
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 90,
                  child: Row(
                    children: const [
                      Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.save,
                        size: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              MaterialButton(
                color: HexColor("#240774"),
                padding: const EdgeInsets.all(20),
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      Text(
                        "Volver",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )

          */
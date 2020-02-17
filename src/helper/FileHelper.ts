import * as fse from 'fs-extra';
import path = require('path');

export class FileHelper {

    // public static createClassFile(name, data) {
    //     fse.outputFile(`download/${name}.ts`,
    //         `export class ${name.charAt(0).toUpperCase() + name.slice(1)} {\n${data.map(({ parameter, datatype }) => ({ parameter, datatype })).map(data => '\t' + data.parameter + ': ' + data.datatype).join(";\n")}\n}`
    //         , err => {
    //             console.log(err);
    //         },
    //         console.log(`${name}.model.ts created`)
    //     );
    // }

    public static createFile(directory, filename, data) {
        fse.outputFile(`download/${directory}/${filename}`, data, err => console.log(err),
            console.log(`${filename} created`))
    }
}

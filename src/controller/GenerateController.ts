import { TemplateHelper } from './../helper/TemplateHelper';
import { FileHelper } from './../helper/FileHelper';
import { Request, Response } from "express";
import * as changeCase from 'change-case';
const readXlsxFile = require('read-excel-file/node');

export class GenerateController {
    static create = async (req: Request, res: Response) => {
        if (!req.files || Object.keys(req.files).length === 0) {
            res.status(400).send('No files were uploaded.');
            return;
        }

        let datafile, uploadPath;

        datafile = req.files.file;

        uploadPath = './uploads/' + datafile.name;

        datafile.mv(uploadPath, function (err) {
            if (err) {
                return res.status(500).send(err);
            }
            const schema = {
                'Sequence': {
                    prop: 'sequence',
                    type: Number
                },
                'Parameters Name': {
                    prop: 'parameter',
                    type: String
                },
                'Minimum Length': {
                    prop: 'minlength',
                    type: Number
                },
                'Maximum Length': {
                    prop: 'maxlength',
                    type: Number
                },
                'Required': {
                    prop: 'mandatory',
                    type: String
                },
                'Field Data Type': {
                    prop: 'datatype',
                    type: String
                },
                'Field Type': {
                    prop: 'type',
                    type: String
                }
            };

            readXlsxFile(uploadPath, { schema }).then(({ rows, errors }) => {

                const name = changeCase.paramCase(datafile.name.substring(0, datafile.name.indexOf(".")));

                let modelData = `{\n${rows.map(({ parameter, datatype }) => ({ parameter, datatype })).map(data => '\t' + data.parameter + ': ' + data.datatype).join(";\n")}\n}`

                let listData = rows.map(({ parameter }) => ({ parameter })).map(data => data.parameter)

                // create model.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}.model.ts`,
                    TemplateHelper.getParsedTemplate(name, 'model.tpl', modelData)
                );

                // create list.component.html
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-list.component.html`,
                    TemplateHelper.getParsedTemplate(name, 'list.html.tpl', listData)
                )

                // create create.component.html
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-create.component.html`,
                    TemplateHelper.getParsedTemplate(name, 'create.html.tpl', rows.slice(1))
                )

                // create edit.component.html
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-edit.component.html`,
                    TemplateHelper.getParsedTemplate(name, 'edit.html.tpl', rows.slice(1))
                )

                // create detail.component.html
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-detail.component.html`,
                    TemplateHelper.getParsedTemplate(name, 'detail.html.tpl', listData)
                )

                // create service.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}s.service.ts`,
                    TemplateHelper.getParsedTemplate(name, 'service.tpl')
                )

                // create module.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}s.module.ts`,
                    TemplateHelper.getParsedTemplate(name, 'module.tpl')
                )

                // create routing.module.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}s.routing.module.ts`,
                    TemplateHelper.getParsedTemplate(name, 'routing.tpl')
                )

                // create list.component.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-list.component.ts`,
                    TemplateHelper.getParsedTemplate(name, 'list.comp.tpl')
                )

                // create list.component.html
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-list.component.html`,
                    TemplateHelper.getParsedTemplate(name, 'list.html.tpl', listData)
                )

                // create edit.component.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-edit.component.ts`,
                    TemplateHelper.getParsedTemplate(name, 'edit.comp.tpl', rows.slice(1))
                )

                // create detail.component.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-detail.component.ts`,
                    TemplateHelper.getParsedTemplate(name, 'detail.comp.tpl')
                )

                // create create.component.ts
                FileHelper.createFile(
                    `${name}s`,
                    `${name}-create.component.ts`,
                    TemplateHelper.getParsedTemplate(name, 'create.comp.tpl', rows.slice(1))
                )

                res.send({
                    name: `${datafile.name.substring(0, datafile.name.indexOf("."))}s`,
                    rows
                });
            })
        });
    }
}
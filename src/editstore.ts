import {defineStore} from "h5-flux";

export interface EditStoreFields {
    [fieldname: string]: EditStoreField,
}

export interface EditStore {
    fields: EditStoreFields,
    focus?: EditStoreField
    validate(): string;
    addRef(): void;
}

export interface EditStoreField {
    labelText: string,
    hintText: string,
    type: string,
    disabled: boolean,
    value: string,
    errorText: string,
    validations: EditValidation[],
    validate(): string;
}

export type EditValidation = (meta: EditStoreField) => string;

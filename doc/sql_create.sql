CREATE TABLE domain_info (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    registrar VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    tier VARCHAR(255) NOT NULL,
    transfer_to VARCHAR(255),
    last_check TIMESTAMP NOT NULL,
    spf VARCHAR(255),
    dmarc VARCHAR(255),
    nameservers TEXT
);


CREATE TABLE domain_info_history (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    registrar VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    tier VARCHAR(255) NOT NULL,
    transfer_to VARCHAR(255),
    last_check TIMESTAMP NOT NULL,
    spf VARCHAR(255),
    dmarc VARCHAR(255),
    nameservers TEXT
);



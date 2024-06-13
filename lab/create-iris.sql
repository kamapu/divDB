create schema data_frames;

create table data_frames.iris (
  id serial primary key,
  petal_length double precision,
  petal_width double precision,
  sepal_length double precision,
  sepal_width double precision,
  species text
);

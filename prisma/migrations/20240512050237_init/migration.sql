/*
  Warnings:

  - The primary key for the `Title` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `attributes` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `isOriginalTitle` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `language` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `ordering` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `region` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `titleId` on the `Title` table. All the data in the column will be lost.
  - You are about to drop the column `types` on the `Title` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[tconst]` on the table `Title` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `isAdult` to the `Title` table without a default value. This is not possible if the table is not empty.
  - Added the required column `originalTitle` to the `Title` table without a default value. This is not possible if the table is not empty.
  - Added the required column `primaryTitle` to the `Title` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tconst` to the `Title` table without a default value. This is not possible if the table is not empty.
  - Added the required column `titleType` to the `Title` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Title" DROP CONSTRAINT "Title_pkey",
DROP COLUMN "attributes",
DROP COLUMN "isOriginalTitle",
DROP COLUMN "language",
DROP COLUMN "ordering",
DROP COLUMN "region",
DROP COLUMN "title",
DROP COLUMN "titleId",
DROP COLUMN "types",
ADD COLUMN     "endYear" INTEGER,
ADD COLUMN     "genres" TEXT[],
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "isAdult" BOOLEAN NOT NULL,
ADD COLUMN     "originalTitle" TEXT NOT NULL,
ADD COLUMN     "primaryTitle" TEXT NOT NULL,
ADD COLUMN     "runtimeMinutes" INTEGER,
ADD COLUMN     "startYear" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "tconst" TEXT NOT NULL,
ADD COLUMN     "titleType" TEXT NOT NULL,
ADD CONSTRAINT "Title_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Title_tconst_key" ON "Title"("tconst");

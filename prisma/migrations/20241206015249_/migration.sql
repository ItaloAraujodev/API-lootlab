/*
  Warnings:

  - You are about to alter the column `marketCap` on the `LaunchInfo` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `VarChar(255)`.
  - You are about to alter the column `privateSale` on the `LaunchInfo` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `VarChar(255)`.
  - You are about to alter the column `publicSale` on the `LaunchInfo` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `VarChar(255)`.
  - You are about to drop the column `investment` on the `Post` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "LaunchInfo" ALTER COLUMN "marketCap" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "totalSupply" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "privateSale" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "publicSale" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "investment",
ALTER COLUMN "score" DROP DEFAULT,
ALTER COLUMN "score" SET DATA TYPE VARCHAR(255);

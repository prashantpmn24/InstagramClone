
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/09/2024 15:52:01
-- Generated from EDMX file: C:\Desktop\Downloads\Instagram-Clone-master\Instagram-Clone-master\InstagramClone\InstagramClone\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__comments__image___07220AB2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comments] DROP CONSTRAINT [FK__comments__image___07220AB2];
GO
IF OBJECT_ID(N'[dbo].[FK__comments__userid__062DE679]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[comments] DROP CONSTRAINT [FK__comments__userid__062DE679];
GO
IF OBJECT_ID(N'[dbo].[FK__images__userid__035179CE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[images] DROP CONSTRAINT [FK__images__userid__035179CE];
GO
IF OBJECT_ID(N'[dbo].[FK__user_imag__image__0AF29B96]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_image_like] DROP CONSTRAINT [FK__user_imag__image__0AF29B96];
GO
IF OBJECT_ID(N'[dbo].[FK__user_imag__image__0EC32C7A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_image_dilike] DROP CONSTRAINT [FK__user_imag__image__0EC32C7A];
GO
IF OBJECT_ID(N'[dbo].[FK__user_imag__useri__09FE775D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_image_like] DROP CONSTRAINT [FK__user_imag__useri__09FE775D];
GO
IF OBJECT_ID(N'[dbo].[FK__user_imag__useri__0DCF0841]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_image_dilike] DROP CONSTRAINT [FK__user_imag__useri__0DCF0841];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[comments];
GO
IF OBJECT_ID(N'[dbo].[Friendship]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Friendship];
GO
IF OBJECT_ID(N'[dbo].[images]', 'U') IS NOT NULL
    DROP TABLE [dbo].[images];
GO
IF OBJECT_ID(N'[dbo].[user_image_dilike]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user_image_dilike];
GO
IF OBJECT_ID(N'[dbo].[user_image_like]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user_image_like];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'comments'
CREATE TABLE [dbo].[comments] (
    [userid] int  NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [comment1] varchar(max)  NULL,
    [image_id] int  NULL
);
GO

-- Creating table 'Friendships'
CREATE TABLE [dbo].[Friendships] (
    [User_Id] int  NOT NULL,
    [Friends] nvarchar(max)  NULL,
    [Friend_Requests] nvarchar(max)  NULL
);
GO

-- Creating table 'images'
CREATE TABLE [dbo].[images] (
    [userid] int  NULL,
    [id] int IDENTITY(1,1) NOT NULL,
    [imagepath] varchar(max)  NULL
);
GO

-- Creating table 'user_image_dilike'
CREATE TABLE [dbo].[user_image_dilike] (
    [id] int IDENTITY(1,1) NOT NULL,
    [userid] int  NULL,
    [image_id] int  NULL
);
GO

-- Creating table 'user_image_like'
CREATE TABLE [dbo].[user_image_like] (
    [id] int IDENTITY(1,1) NOT NULL,
    [userid] int  NULL,
    [image_id] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [id] int IDENTITY(1,1) NOT NULL,
    [First_Name] nvarchar(50)  NULL,
    [Last_Name] nvarchar(50)  NULL,
    [email] nvarchar(50)  NULL,
    [phone] int  NULL,
    [Passwords] varchar(60)  NULL,
    [profileimage] varchar(max)  NULL,
    [bio] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [PK_comments]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [User_Id] in table 'Friendships'
ALTER TABLE [dbo].[Friendships]
ADD CONSTRAINT [PK_Friendships]
    PRIMARY KEY CLUSTERED ([User_Id] ASC);
GO

-- Creating primary key on [id] in table 'images'
ALTER TABLE [dbo].[images]
ADD CONSTRAINT [PK_images]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'user_image_dilike'
ALTER TABLE [dbo].[user_image_dilike]
ADD CONSTRAINT [PK_user_image_dilike]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'user_image_like'
ALTER TABLE [dbo].[user_image_like]
ADD CONSTRAINT [PK_user_image_like]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [image_id] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK__comments__image___07220AB2]
    FOREIGN KEY ([image_id])
    REFERENCES [dbo].[images]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__comments__image___07220AB2'
CREATE INDEX [IX_FK__comments__image___07220AB2]
ON [dbo].[comments]
    ([image_id]);
GO

-- Creating foreign key on [userid] in table 'comments'
ALTER TABLE [dbo].[comments]
ADD CONSTRAINT [FK__comments__userid__062DE679]
    FOREIGN KEY ([userid])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__comments__userid__062DE679'
CREATE INDEX [IX_FK__comments__userid__062DE679]
ON [dbo].[comments]
    ([userid]);
GO

-- Creating foreign key on [userid] in table 'images'
ALTER TABLE [dbo].[images]
ADD CONSTRAINT [FK__images__userid__035179CE]
    FOREIGN KEY ([userid])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__images__userid__035179CE'
CREATE INDEX [IX_FK__images__userid__035179CE]
ON [dbo].[images]
    ([userid]);
GO

-- Creating foreign key on [image_id] in table 'user_image_like'
ALTER TABLE [dbo].[user_image_like]
ADD CONSTRAINT [FK__user_imag__image__0AF29B96]
    FOREIGN KEY ([image_id])
    REFERENCES [dbo].[images]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__user_imag__image__0AF29B96'
CREATE INDEX [IX_FK__user_imag__image__0AF29B96]
ON [dbo].[user_image_like]
    ([image_id]);
GO

-- Creating foreign key on [image_id] in table 'user_image_dilike'
ALTER TABLE [dbo].[user_image_dilike]
ADD CONSTRAINT [FK__user_imag__image__0EC32C7A]
    FOREIGN KEY ([image_id])
    REFERENCES [dbo].[images]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__user_imag__image__0EC32C7A'
CREATE INDEX [IX_FK__user_imag__image__0EC32C7A]
ON [dbo].[user_image_dilike]
    ([image_id]);
GO

-- Creating foreign key on [userid] in table 'user_image_dilike'
ALTER TABLE [dbo].[user_image_dilike]
ADD CONSTRAINT [FK__user_imag__useri__0DCF0841]
    FOREIGN KEY ([userid])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__user_imag__useri__0DCF0841'
CREATE INDEX [IX_FK__user_imag__useri__0DCF0841]
ON [dbo].[user_image_dilike]
    ([userid]);
GO

-- Creating foreign key on [userid] in table 'user_image_like'
ALTER TABLE [dbo].[user_image_like]
ADD CONSTRAINT [FK__user_imag__useri__09FE775D]
    FOREIGN KEY ([userid])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__user_imag__useri__09FE775D'
CREATE INDEX [IX_FK__user_imag__useri__09FE775D]
ON [dbo].[user_image_like]
    ([userid]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
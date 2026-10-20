Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62701606A31B
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=PvCcriax
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58FC10E228;
	Tue, 20 Oct 2026 12:53:43 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B220B10E3E5
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 12:26:12 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-53664b4860bso22175721cf.1
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Oct 2026 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1792499172;
 x=1793103972; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YVgIUoqL9XbQ9jhWO6BKDxkXvvi2AxiprGJLNOZ4iOE=;
 b=PvCcriaxOSRydvR09CxP6VMLj7C4RR25kgfjmPntCt7Z8+jepA6pWa2xrOklBET2BV
 +6d1PP/T3VjuEjSLVjghpKUsggUh+EwIHTCDr15e4wo1JkmpToe9x1OZViOIN7nrW8aX
 yNIAYZ2uEdV2NeZbEKmrKZUaGI1YSfdxPd69ohHjX/HcgKbAcT3bPWoqKPLqTS4NsIKB
 iZf34AUhlzus6Og2MPbOjTB40n0s8K5+EYj8qdlu443cGLpvMHOlrQO1taE/eZGUVOwK
 bSzweYS2WRwRTU4BxXla3KDFGdG2hPk6ja/vGVWkJn9rbcURbiFMZqO66LqY6xSuaSGw
 Sl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792499172; x=1793103972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YVgIUoqL9XbQ9jhWO6BKDxkXvvi2AxiprGJLNOZ4iOE=;
 b=y+YT/Q8SB68yhN+fAcdI4hri58VLFYIRrnepLY8YKCdM0sX+PqmjUEo/5rXvnblUD3
 wJDaxjQmaSRl1EdzAJQA7QAUqLoUwiUb34vBealDHDR4Rex831GnL2TYD/GPFGBtGrva
 QRewOF/vgCltaoGtoAt3EpvndO8b8fWdWymXn6Xq/WzFVJdz/7ZCgZJTO7hyQD9KZhNl
 aFzpOUutiG1iY7LDOv0pCrmUPCKBGGiLhZPv0Sa7TMom6mQ3V9h88p0sGIjit062m1TM
 FDBqDW4DlNfA/vndBOwDH6trajuQEUsYoS9rIGumUIWMqkL6WFsE3nldVFoQx+Mu14bW
 GzkQ==
X-Gm-Message-State: AFq9FYLb0HJkD+pKDmqlOyvwUW/WYXIvCSQWwcP41s3rXUCzesUFe1xu
 knABoQtImeyKzbhwA4hgs1Kccjp6kp84xGBxlJdLZPWQIrzrMAH4iJF34PoQeewgejs=
X-Gm-Gg: AYBFou3+ygADl7VGHZjy5RjldO+sgPvRH2lEO/oQZ//3b7XC0QBlukEQkOkPGk+KEoi
 hEBLUoudOd6zvH7CYjGx6urPRTk4Nml21Zx/2fLe+1J+8P5hWL7TYCxE8nHG3iE1tX2XSBmxKtQ
 vQemgNxRUwVfm7kkcQStaokmqYZapROsusB0WYyUJ8mz1hfdfO8lfH7UXM2hRd14Z9RoEFiSX/6
 DB1rvXJnqiihpHpExuFaa7KCAT42NsVi8Hs30fpDkje2udAnWgoZekBk0/F0A97xKQY6OTNHNR5
 ljk1Bqvik5HKLYvRM4Iav2q5f+nzaCDMHLEYV/ypZ6RKP97gpl2OvqHdOphAo7RWG6YbVldVqXB
 FMx/dOYTIffktjD686397r4QDt4+TUQTgQ/etE3bmR3BxUrZ/IbAzKNkjSwTa8q6lhhtkuvlv3e
 oOUCehhegMe9cEZuChoSZsztOGvofVXANuJfCQL99u08nBnfARzz1w4gOMtFpjmm6wvZ/ItIwNO
 b6d4jcU4kmgP8NZTB7R/2r7LaQekg9afR65O3WS5UBIqPGCL+8so9qikxmenj5AYZIRqeM8kwPo
 Ar9tY/V8GAKgaKWWaCvzEAjw9sX0ZWcNxpu0+aalhSw5LE2ZhhRliyGZjINzxnjZ6DyHESSelgP
 ABao/d4IFuisOkDCO8fXS5NjpQNKyRQKj
X-Received: by 2002:a05:622a:50f:b0:530:fbd1:6094 with SMTP id
 d75a77b69052e-53646097a4amr164462231cf.53.1792499171659; 
 Tue, 20 Oct 2026 05:26:11 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a98e071sm123258551cf.16.2026.10.20.05.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 05:26:10 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Tue, 20 Oct 2026 08:26:07 -0400
Message-ID: <20261020122607.925427-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:43 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jouni,

Sorry, my last mails made that unclear. Your patch alone does fix it:
with the AS SDP kept on in PR Active, Panel Replay is smooth here,
including after screen off/on. My Tested-by stands.

The RFC was only about power: with the AS SDP always on in PR Active
I see no DC5 entries on a static screen. Fair enough that it is not
understood, so please drop it. If I can show a real battery cost I
will come back with numbers.

Could your patch go in as is?

Jake

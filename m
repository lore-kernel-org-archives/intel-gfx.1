Return-Path: <SRS0=qmob=B3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A30C433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2020 13:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6622076E
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2020 13:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyMcWayB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6622076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE486E2F9;
	Mon, 17 Aug 2020 13:02:23 +0000 (UTC)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113966E0F8;
 Mon, 17 Aug 2020 09:18:00 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id d4so7395278pjx.5;
 Mon, 17 Aug 2020 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b4rgdbawNMIYfrAuQkyVo4UViOG64WWeDycX+5MFQIw=;
 b=PyMcWayBkiZh2L1sh4qEZP3dTK3G8sAqxmaVVytXPS3SWG3GgG94sw6o0Nrcf1df+Q
 wERBWbwHQv6Qgu7hNTSGUUVnjknbD/6NI8hJDMspn8CczdQvJPM76KBjotTKq1nRqCMz
 PeaUjGlQDtl3+8tYa2241Lt0gFMVJ1Pj2m5WjIwAk0QPXbTouobbDDQHD7yRGFSTHJfF
 TGVqoP9D0FSDOwtCHrJQip7z1NvCco4b1IQwWbk2n5T8eRS7cLsH017gTERiI8GS8Tqs
 077uDrcWAyQImiWo67W3QAf+RCwJGajol8woY3NpuxxUzfr5gmwXTFilhRPsJnsV/onK
 O2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b4rgdbawNMIYfrAuQkyVo4UViOG64WWeDycX+5MFQIw=;
 b=SaGIuUg+usJdz7Fb38hh1G2evkTN59y6pxyhz+tovL2l2DD1YS3Yd9R1jLJ+nwwFaf
 OL6xjSKbshraBm/Wq2/y3EFg9ntNbOC1v67tP9W8krLrEu312AfGpyACGA2Ed4yqHOjq
 yp7n2qXIcdwz3XOv42CyOV4nOR5u+VKtmM/uBpoFcu/5sWdkm4dmrJOeWpNKob1FJCwk
 M03njbpMMqau0q9L1V0o1y6+tvFci7KsCeexnkGZkWutcGKFhpiHW+wT0i2FmPwZuFAG
 nbilHtaaCJlbINSaiooLoQgO2aSIocwUwhvxiDMieyX9B5H8uuHR/Lnr/S+TJ7B9TmOA
 t9gw==
X-Gm-Message-State: AOAM531YY7UEvJOM+ky7p1U8+Iudawey2qqoB17mZjTGt/uLKQkkKvpn
 yyEWmLu243HWxOGTWDcVD8M=
X-Google-Smtp-Source: ABdhPJwJpNSWTk4IID0rEMXxIuI6kibpl/4HWTcEM39pCyHeMQh+u9mKWbVjT3TDQxfuQPdXa1o+UA==
X-Received: by 2002:a17:90a:a65:: with SMTP id
 o92mr11920119pjo.104.1597655879719; 
 Mon, 17 Aug 2020 02:17:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r25sm15971028pgv.88.2020.08.17.02.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:17:59 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 3chas3@gmail.com, axboe@kernel.dk, stefanr@s5r6.in-berlin.de,
 airlied@linux.ie, daniel@ffwll.ch, sre@kernel.org,
 James.Bottomley@HansenPartnership.com, kys@microsoft.com, deller@gmx.de,
 dmitry.torokhov@gmail.com, jassisinghbrar@gmail.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, maximlevitsky@gmail.com, oakad@yahoo.com,
 ulf.hansson@linaro.org, mporter@kernel.crashing.org, alex.bou9@gmail.com,
 broonie@kernel.org, martyn@welchs.me.uk, manohar.vanga@gmail.com,
 mitch@sfgoth.com, davem@davemloft.net, kuba@kernel.org
Date: Mon, 17 Aug 2020 14:46:01 +0530
Message-Id: <20200817091617.28119-7-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817091617.28119-1-allen.cryptic@gmail.com>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 13:02:22 +0000
Subject: [Intel-gfx] [PATCH] drivers: rapidio: convert tasklets to use new
 tasklet_setup() API
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 keescook@chromium.org, linux-parisc@vger.kernel.org,
 linux-ntb@googlegroups.com, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-atm-general@lists.sourceforge.net,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-block@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Allen Pais <allen.lkml@gmail.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/rapidio/devices/tsi721_dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rapidio/devices/tsi721_dma.c b/drivers/rapidio/devices/tsi721_dma.c
index d375c02059f3..4a2bb6d7c692 100644
--- a/drivers/rapidio/devices/tsi721_dma.c
+++ b/drivers/rapidio/devices/tsi721_dma.c
@@ -566,9 +566,9 @@ static void tsi721_advance_work(struct tsi721_bdma_chan *bdma_chan,
 		  bdma_chan->id);
 }
 
-static void tsi721_dma_tasklet(unsigned long data)
+static void tsi721_dma_tasklet(struct tasklet_struct *t)
 {
-	struct tsi721_bdma_chan *bdma_chan = (struct tsi721_bdma_chan *)data;
+	struct tsi721_bdma_chan *bdma_chan = from_tasklet(bdma_chan, t, tasklet);
 	u32 dmac_int, dmac_sts;
 
 	dmac_int = ioread32(bdma_chan->regs + TSI721_DMAC_INT);
@@ -988,8 +988,7 @@ int tsi721_register_dma(struct tsi721_device *priv)
 		INIT_LIST_HEAD(&bdma_chan->queue);
 		INIT_LIST_HEAD(&bdma_chan->free_list);
 
-		tasklet_init(&bdma_chan->tasklet, tsi721_dma_tasklet,
-			     (unsigned long)bdma_chan);
+		tasklet_setup(&bdma_chan->tasklet, tsi721_dma_tasklet);
 		list_add_tail(&bdma_chan->dchan.device_node,
 			      &mport->dma.channels);
 		nr_channels++;
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

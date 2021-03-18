Return-Path: <SRS0=R2gn=IU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C6AC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 09:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2911061931
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 09:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2911061931
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FE489E06;
	Mon, 22 Mar 2021 09:10:25 +0000 (UTC)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6BE6E0FB;
 Thu, 18 Mar 2021 10:21:47 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id l132so1399428qke.7;
 Thu, 18 Mar 2021 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Xr7Q5W0mf+yiUAVixOuldC+FC1OKy7M7Vy31w+xy1Y=;
 b=TEtG4SdAnzFyy/M2rKDKRnqAVekeFrgpAB2iHD5DbcokIKv4I1qcJq6kttnmIaFOPG
 FA9XdKTGR191nxkB/ni54K5QALdJR2VrdcDuOMVEeqqjUdHLd6ag5k9tQ0UfoyWAyicU
 2+XaSdblLbp6au25IshXW5b5JgmOK7MWgbLsuIECUC8WBa+6rP/0Y2bndmwmzBJBfglU
 Zyy/TRO2ga/nkQkmmXBnXCezg9UEB3VLARDsYcpMlhXvP2Am9qvPbN2bKIBUPCZPaHmQ
 KrWVzK/dYiFcKm4TOl6n+l34Pz44dhj5abexVwtedQ+ZikXrjKVYMwUDqNGEwPVenyMK
 H5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Xr7Q5W0mf+yiUAVixOuldC+FC1OKy7M7Vy31w+xy1Y=;
 b=JM4Xi0RCPW3OHjSGFJRFKrmTdndC8ZDaQCDgZFr0sRJInqIyRXtL+zO0TIos3EquVv
 o+bAkElwvml5dJNyNProP6qainNbq4BDQOhDNgCMcCBILHwI47MO8lFJVxiPLLptfh3i
 gcJ84RAiBfEk6DXiVfkpJT56IOoLz7yq7zvBHOOEojpuVUkKMGz2exRKzZRGkZMrhvBS
 sYEa8Ozutff4fUbkSwWBONI6Pdr+t/UQzFmmwkYDlUDsWiqyfy0hdoUPPUw4PczMq0qT
 s9AsBGOQ5Sx/QGk6pziCzoO/y6wRTLXMwqywNCT1+D2aytKZTL0dY1c6gLzbqqXCGuM4
 Nn3g==
X-Gm-Message-State: AOAM5326PUDaTss73DOKbD0NTx7JVMDd9q9oGpXQ/FlCeAs6d1UECYmj
 dV1NNbXCiVVVTimluYqHP0I=
X-Google-Smtp-Source: ABdhPJzDRs+L/5k4egcTCwL/J4AHYZ9kwMa0q9V42HhyhSCgubQPEP3sb7Y0pb0+6jOA69PKKwYxsg==
X-Received: by 2002:a37:6294:: with SMTP id w142mr3528165qkb.255.1616062906647; 
 Thu, 18 Mar 2021 03:21:46 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.246])
 by smtp.gmail.com with ESMTPSA id r3sm1364387qkm.129.2021.03.18.03.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 03:21:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
 mika.kuoppala@linux.intel.com, unixbhaskar@gmail.com,
 maarten.lankhorst@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 18 Mar 2021 15:49:32 +0530
Message-Id: <20210318101932.19894-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Mar 2021 09:10:08 +0000
Subject: [Intel-gfx] [PATCH] drm/i915/gt: A typo fix
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


s/bariers/barriers/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 037b0e3ccbed..25fc7f44fee0 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -435,7 +435,7 @@ void intel_timeline_exit(struct intel_timeline *tl)
 	spin_unlock(&timelines->lock);

 	/*
-	 * Since this timeline is idle, all bariers upon which we were waiting
+	 * Since this timeline is idle, all barriers upon which we were waiting
 	 * must also be complete and so we can discard the last used barriers
 	 * without loss of information.
 	 */
--
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

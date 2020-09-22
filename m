Return-Path: <SRS0=0qc7=C7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12B0C4727C
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 17:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AF142388B
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2020 17:54:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyxWqDCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AF142388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB51D89E2A;
	Tue, 22 Sep 2020 17:54:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7621789DD8
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Sep 2020 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600797254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jbgzaUIaC3I5CqsNeSXK2pw89V07O3bxrn1V2PULJZw=;
 b=hyxWqDCqOF6yXo9NVlm3UL8dlTI7O/yBj/rMYZWnxRLC8RfrGX8olOPl/R+9UCrFM55DYi
 fEi77um4aKxvioq7p/40O2uDTpMLccHMW4PG2yeZxTVGvw/6+3ScEMb1XKaElRAI9dEEw7
 JehTYL8LpQmG+SUOMew7myb7Fu/KXU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-QEuWgwRFOfmN2XnJ5gyx_Q-1; Tue, 22 Sep 2020 13:54:11 -0400
X-MC-Unique: QEuWgwRFOfmN2XnJ5gyx_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B289CC00;
 Tue, 22 Sep 2020 17:54:10 +0000 (UTC)
Received: from Ruby.redhat.com (unknown [10.10.115.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFF657368D;
 Tue, 22 Sep 2020 17:54:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 22 Sep 2020 13:53:55 -0400
Message-Id: <20200922175357.42998-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Intel-gfx] [RESEND PATCH 0/2] drm/i915: kernel-doc fixes for new
 DP helpers
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Note that none of the code that this touches is in i915, however at the
time I posted this patch all of the DP helpers that concern these
patches were added through drm-intel-next-queued, not drm-misc-next, so
it makes more sense to merge it through drm-intel-next-queued. As such,
I'm just sending this onto intel-gfx so that it gets a patch ID.

This should introduce no functional changes, and is already reviewed by
me.

Mauro Carvalho Chehab (2):
  drm/dp: fix kernel-doc warnings at drm_dp_helper.c
  drm/dp: fix a kernel-doc issue at drm_edid.c

 drivers/gpu/drm/drm_dp_helper.c | 5 +++++
 drivers/gpu/drm/drm_edid.c      | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

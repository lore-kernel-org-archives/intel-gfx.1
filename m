Return-Path: <SRS0=K65z=IY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE74C433C1
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 20:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C990A61A0D
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Mar 2021 20:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C990A61A0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256146F48A;
	Fri, 26 Mar 2021 20:38:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432BF6F48C
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Mar 2021 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IP5jauqp8OdsjP5x9O7uuZxVtg2NRwZRq+0ra1AIJtU=;
 b=A2aQI1R7W/IYCP7V28ubTNhi6gJ7hmEqGxj/bbKdIBSaHzHnjHbikud/luddrEAdyPAiyO
 jBbtRURK2TnagonuijZwgUkCrB2X7bK13kDG8S+R0WhHn4Xv2wOkLR5GGfol7EO0uy9h1I
 Wct2akiRV2PApgMWVWDEDHuqEWATwfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-7CleN5A0PKusiXcy6HW4tg-1; Fri, 26 Mar 2021 16:38:23 -0400
X-MC-Unique: 7CleN5A0PKusiXcy6HW4tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1231009E29;
 Fri, 26 Mar 2021 20:38:21 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F05D5DAA5;
 Fri, 26 Mar 2021 20:38:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Fri, 26 Mar 2021 16:37:48 -0400
Message-Id: <20210326203807.105754-2-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Intel-gfx] [PATCH v2 01/20] drm/dp: Fixup kernel docs for struct
 drm_dp_aux
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

* Make sure that struct members are referred to using @, otherwise they
  won't be formatted as such
* Make sure to refer to other struct types using & so they link back to
  each struct's definition
* Make sure to precede constant values with % so they're formatted
  correctly

Signed-off-by: Lyude Paul <lyude@redhat.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/drm/drm_dp_helper.h | 44 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 632ad7faa006..5efa0d329b67 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1844,34 +1844,34 @@ struct drm_dp_aux_cec {
  * @crc_count: counter of captured frame CRCs
  * @transfer: transfers a message representing a single AUX transaction
  *
- * The .dev field should be set to a pointer to the device that implements
- * the AUX channel.
+ * The @dev field should be set to a pointer to the device that implements the
+ * AUX channel.
  *
- * The .name field may be used to specify the name of the I2C adapter. If set to
- * NULL, dev_name() of .dev will be used.
+ * The @name field may be used to specify the name of the I2C adapter. If set to
+ * %NULL, dev_name() of @dev will be used.
  *
- * Drivers provide a hardware-specific implementation of how transactions
- * are executed via the .transfer() function. A pointer to a drm_dp_aux_msg
+ * Drivers provide a hardware-specific implementation of how transactions are
+ * executed via the @transfer() function. A pointer to a &drm_dp_aux_msg
  * structure describing the transaction is passed into this function. Upon
- * success, the implementation should return the number of payload bytes
- * that were transferred, or a negative error-code on failure. Helpers
- * propagate errors from the .transfer() function, with the exception of
- * the -EBUSY error, which causes a transaction to be retried. On a short,
- * helpers will return -EPROTO to make it simpler to check for failure.
+ * success, the implementation should return the number of payload bytes that
+ * were transferred, or a negative error-code on failure. Helpers propagate
+ * errors from the @transfer() function, with the exception of the %-EBUSY
+ * error, which causes a transaction to be retried. On a short, helpers will
+ * return %-EPROTO to make it simpler to check for failure.
  *
  * An AUX channel can also be used to transport I2C messages to a sink. A
- * typical application of that is to access an EDID that's present in the
- * sink device. The .transfer() function can also be used to execute such
- * transactions. The drm_dp_aux_register() function registers an I2C
- * adapter that can be passed to drm_probe_ddc(). Upon removal, drivers
- * should call drm_dp_aux_unregister() to remove the I2C adapter.
- * The I2C adapter uses long transfers by default; if a partial response is
- * received, the adapter will drop down to the size given by the partial
- * response for this transaction only.
+ * typical application of that is to access an EDID that's present in the sink
+ * device. The @transfer() function can also be used to execute such
+ * transactions. The drm_dp_aux_register() function registers an I2C adapter
+ * that can be passed to drm_probe_ddc(). Upon removal, drivers should call
+ * drm_dp_aux_unregister() to remove the I2C adapter. The I2C adapter uses long
+ * transfers by default; if a partial response is received, the adapter will
+ * drop down to the size given by the partial response for this transaction
+ * only.
  *
- * Note that the aux helper code assumes that the .transfer() function
- * only modifies the reply field of the drm_dp_aux_msg structure.  The
- * retry logic and i2c helpers assume this is the case.
+ * Note that the aux helper code assumes that the @transfer() function only
+ * modifies the reply field of the &drm_dp_aux_msg structure. The retry logic
+ * and i2c helpers assume this is the case.
  */
 struct drm_dp_aux {
 	const char *name;
-- 
2.30.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

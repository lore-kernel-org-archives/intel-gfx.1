Return-Path: <SRS0=Slz9=JT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF9AC433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Apr 2021 18:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D00E7613B7
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Apr 2021 18:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D00E7613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC706E57E;
	Thu, 22 Apr 2021 18:30:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942346E57E
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Apr 2021 18:30:06 +0000 (UTC)
IronPort-SDR: G+vEqxq6gJYn7FGxixpzCvVF+XLmgQbTPvXdRbBNfp/uWmEvo7Ek2PKO8mkQYgpd5OilOxeHd4
 gbEUCyUoWJDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="193829982"
X-IronPort-AV: E=Sophos;i="5.82,243,1613462400"; d="scan'208";a="193829982"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 11:30:06 -0700
IronPort-SDR: gARroESBq/xuXwM8vKZpY2cxQWDu4Jf6OS+MwnXj41mQb7xt3YyXTh1GAjdG/hoY02+ELfSewe
 n7Exc+hYmyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,243,1613462400"; d="scan'208";a="428065550"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 22 Apr 2021 11:30:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Apr 2021 21:30:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Apr 2021 21:29:57 +0300
Message-Id: <20210422182957.10022-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422182957.10022-1-ville.syrjala@linux.intel.com>
References: <20210422182957.10022-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915: Remove redundant DIRTYFB
 frontbuffer flushes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBmcm9udGJ1ZmZlciB0cmFja2luZyBjb2RlIGlzIHN1cHBvc2VkIHRvIGhhbmRsZSBwbGFuZQp1
cGRhdGVzIHZpYSBPUklHSU5fRkxJUC4gUmlnaHQgbm93IHdlJ3JlIGFsc28gZG9pbmcgaW50ZXJu
YWwKT1JJR0lOX0RJUlRZRkIgZmx1c2hlcyBmb3Igc29tZSByZWFzb24uIENhbid0IHNlZSB0aGUg
cG9pbnQKc28gZ2V0IHJpZCBvZiB0aGVtLgoKSW4gZmFjdCBvbiBHTEsrIHRoZXNlIGFyZSBhY2l2
ZWx5IGhhcm1mdWwgYW5kIG9ubHkgcmlzayBhbmdlcmluZwp0aGUgaGFyZHdhcmUgYW5kIGNhdXNp
bmcgRkJDIHRvIHNjYW4gb3V0IGNvcnJ1cHRlZCBkYXRhLiBUaGUKaGFyZHdhcmUgZmxpcCBudWtl
IG1lY2hhbmlzbSB3aWxsIHRha2UgY2FyZSBvZiB0aGluZ3MgZm9yIEZCQy4KV2l0aCBhbGwgdGhl
IHJlZHVuZGFudCBtYW51YWwgbnVrZXMgcmVtb3ZlZCBhdCBsZWFzdCB3b3JrbG9hZHMKdGhhdCBk
b24ndCBkbyBhbnkgZnJvbnRidWZmZXIgcmVuZGVyaW5nIHNob3VsZCBiZSBzYWZlIGZyb20KaGl0
dGluZyB0aGF0IGNvcnJ1cHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKaW5k
ZXggYTEwZTI2MzgwZWYzLi5iZDQ4MjcyMzExZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCkBAIC0xNzE4LDggKzE3MTgsNiBAQCBpbnRlbF9maW5k
X2luaXRpYWxfcGxhbmVfb2JqKHN0cnVjdCBpbnRlbF9jcnRjICppbnRlbF9jcnRjLAogCWludGVs
X3BsYW5lX2NvcHlfdWFwaV90b19od19zdGF0ZShpbnRlbF9zdGF0ZSwgaW50ZWxfc3RhdGUsCiAJ
CQkJCSAgaW50ZWxfY3J0Yyk7CiAKLQlpbnRlbF9mcm9udGJ1ZmZlcl9mbHVzaCh0b19pbnRlbF9m
cm9udGJ1ZmZlcihmYiksIE9SSUdJTl9ESVJUWUZCKTsKLQogCWF0b21pY19vcih0b19pbnRlbF9w
bGFuZShwcmltYXJ5KS0+ZnJvbnRidWZmZXJfYml0LAogCQkgICZ0b19pbnRlbF9mcm9udGJ1ZmZl
cihmYiktPmJpdHMpOwogfQpAQCAtMTA2MzMsNyArMTA2MzEsNiBAQCBpbnRlbF9wcmVwYXJlX3Bs
YW5lX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKl9wbGFuZSwKIAkJcmV0dXJuIHJldDsKIAogCWk5MTVf
Z2VtX29iamVjdF93YWl0X3ByaW9yaXR5KG9iaiwgMCwgJmF0dHIpOwotCWk5MTVfZ2VtX29iamVj
dF9mbHVzaF9mcm9udGJ1ZmZlcihvYmosIE9SSUdJTl9ESVJUWUZCKTsKIAogCWlmICghbmV3X3Bs
YW5lX3N0YXRlLT51YXBpLmZlbmNlKSB7IC8qIGltcGxpY2l0IGZlbmNpbmcgKi8KIAkJc3RydWN0
IGRtYV9mZW5jZSAqZmVuY2U7Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAo=

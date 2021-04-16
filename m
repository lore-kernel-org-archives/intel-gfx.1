Return-Path: <SRS0=UFhG=JN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0CBC433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 17:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DAA61073
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Apr 2021 17:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DAA61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032376EC7A;
	Fri, 16 Apr 2021 17:10:34 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AD56EC7A
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Apr 2021 17:10:32 +0000 (UTC)
IronPort-SDR: bdkWOZ/PNaiMKhVgzyEZ3PlefE1EWmF4bTQ+45rv9spvwJyW4XFdDgbdkahrdxjyU005+eZhLU
 pOmaDGk5b9oQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="182196985"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="182196985"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 10:10:32 -0700
IronPort-SDR: YmocjL9TCP8yfZWlfbZNdn/3BCiASpHnt93Pq88/c7Q+iDr7M6Mchol2Do1CM2rmiVFMx9f49H
 OFDZLWPr3jJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="399966189"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 16 Apr 2021 10:10:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Apr 2021 20:10:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Apr 2021 20:10:08 +0300
Message-Id: <20210416171011.19012-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210416171011.19012-1-ville.syrjala@linux.intel.com>
References: <20210416171011.19012-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 5/8] drm/i915: Use intel_de_rmw() for
 DBUF_POWER_REQUEST
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClVz
ZSBpbnRlbF9kZV9ybXcoKSBpbnN0ZWFkIG9mIGhhbmQgcm9sbGluZyBpdC4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMgfCA5ICsr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
cG93ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dl
ci5jCmluZGV4IDA0MzUxMDMwODJlYi4uNTI4ZmJlZGUwZWU3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYwpAQCAtNDc1NywxNCAr
NDc1Nyw5IEBAIHN0YXRpYyB2b2lkIGdlbjlfZGJ1Zl9zbGljZV9zZXQoc3RydWN0IGRybV9pOTE1
X3ByaXZhdGUgKmRldl9wcml2LAogewogCWk5MTVfcmVnX3QgcmVnID0gREJVRl9DVExfUyhzbGlj
ZSk7CiAJYm9vbCBzdGF0ZTsKLQl1MzIgdmFsOwogCi0JdmFsID0gaW50ZWxfZGVfcmVhZChkZXZf
cHJpdiwgcmVnKTsKLQlpZiAoZW5hYmxlKQotCQl2YWwgfD0gREJVRl9QT1dFUl9SRVFVRVNUOwot
CWVsc2UKLQkJdmFsICY9IH5EQlVGX1BPV0VSX1JFUVVFU1Q7Ci0JaW50ZWxfZGVfd3JpdGUoZGV2
X3ByaXYsIHJlZywgdmFsKTsKKwlpbnRlbF9kZV9ybXcoZGV2X3ByaXYsIHJlZywgREJVRl9QT1dF
Ul9SRVFVRVNULAorCQkgICAgIGVuYWJsZSA/IERCVUZfUE9XRVJfUkVRVUVTVCA6IDApOwogCWlu
dGVsX2RlX3Bvc3RpbmdfcmVhZChkZXZfcHJpdiwgcmVnKTsKIAl1ZGVsYXkoMTApOwogCi0tIAoy
LjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=

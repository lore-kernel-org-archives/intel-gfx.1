Return-Path: <SRS0=maCC=IV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20214C433E1
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 15:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40E861963
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 15:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E40E861963
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9DD6EAE1;
	Tue, 23 Mar 2021 15:51:29 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C586EA7A
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Mar 2021 15:51:16 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Mar 2021 16:50:09 +0100
Message-Id: <20210323155059.628690-21-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v9 20/70] drm/i915: Handle ww locking in
 init_status_page
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

VHJ5IHRvIHBpbiB0byBnZ3R0IGZpcnN0LCBhbmQgdXNlIGEgZnVsbCB3dyBsb29wIHRvIGhhbmRs
ZQpldmljdGlvbiBjb3JyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhl
bGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jIHwgMzcgKysrKysrKysrKysrKysrLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdpbmVfY3MuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9jcy5jCmluZGV4IGU2Y2VmZDAw
YjRhMS4uODU5Yzc5YjBkNmVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9lbmdpbmVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9lbmdp
bmVfY3MuYwpAQCAtNjAyLDYgKzYwMiw3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfc3RhdHVzX3Bh
Z2Uoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQogfQogCiBzdGF0aWMgaW50IHBpbl9n
Z3R0X3N0YXR1c19wYWdlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwKKwkJCQlzdHJ1
Y3QgaTkxNV9nZW1fd3dfY3R4ICp3dywKIAkJCQlzdHJ1Y3QgaTkxNV92bWEgKnZtYSkKIHsKIAl1
bnNpZ25lZCBpbnQgZmxhZ3M7CkBAIC02MjIsMTIgKzYyMywxMyBAQCBzdGF0aWMgaW50IHBpbl9n
Z3R0X3N0YXR1c19wYWdlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSwKIAllbHNlCiAJ
CWZsYWdzID0gUElOX0hJR0g7CiAKLQlyZXR1cm4gaTkxNV9nZ3R0X3Bpbih2bWEsIE5VTEwsIDAs
IGZsYWdzKTsKKwlyZXR1cm4gaTkxNV9nZ3R0X3Bpbih2bWEsIHd3LCAwLCBmbGFncyk7CiB9CiAK
IHN0YXRpYyBpbnQgaW5pdF9zdGF0dXNfcGFnZShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdp
bmUpCiB7CiAJc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iajsKKwlzdHJ1Y3QgaTkxNV9n
ZW1fd3dfY3R4IHd3OwogCXN0cnVjdCBpOTE1X3ZtYSAqdm1hOwogCXZvaWQgKnZhZGRyOwogCWlu
dCByZXQ7CkBAIC02NTMsMzAgKzY1NSwzOSBAQCBzdGF0aWMgaW50IGluaXRfc3RhdHVzX3BhZ2Uo
c3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQogCXZtYSA9IGk5MTVfdm1hX2luc3RhbmNl
KG9iaiwgJmVuZ2luZS0+Z3QtPmdndHQtPnZtLCBOVUxMKTsKIAlpZiAoSVNfRVJSKHZtYSkpIHsK
IAkJcmV0ID0gUFRSX0VSUih2bWEpOwotCQlnb3RvIGVycjsKKwkJZ290byBlcnJfcHV0OwogCX0K
IAorCWk5MTVfZ2VtX3d3X2N0eF9pbml0KCZ3dywgdHJ1ZSk7CityZXRyeToKKwlyZXQgPSBpOTE1
X2dlbV9vYmplY3RfbG9jayhvYmosICZ3dyk7CisJaWYgKCFyZXQgJiYgIUhXU19ORUVEU19QSFlT
SUNBTChlbmdpbmUtPmk5MTUpKQorCQlyZXQgPSBwaW5fZ2d0dF9zdGF0dXNfcGFnZShlbmdpbmUs
ICZ3dywgdm1hKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycjsKKwogCXZhZGRyID0gaTkxNV9nZW1f
b2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQik7CiAJaWYgKElTX0VSUih2YWRkcikpIHsK
IAkJcmV0ID0gUFRSX0VSUih2YWRkcik7Ci0JCWdvdG8gZXJyOworCQlnb3RvIGVycl91bnBpbjsK
IAl9CiAKIAllbmdpbmUtPnN0YXR1c19wYWdlLmFkZHIgPSBtZW1zZXQodmFkZHIsIDAsIFBBR0Vf
U0laRSk7CiAJZW5naW5lLT5zdGF0dXNfcGFnZS52bWEgPSB2bWE7CiAKLQlpZiAoIUhXU19ORUVE
U19QSFlTSUNBTChlbmdpbmUtPmk5MTUpKSB7Ci0JCXJldCA9IHBpbl9nZ3R0X3N0YXR1c19wYWdl
KGVuZ2luZSwgdm1hKTsKLQkJaWYgKHJldCkKLQkJCWdvdG8gZXJyX3VucGluOwotCX0KLQotCXJl
dHVybiAwOwotCiBlcnJfdW5waW46Ci0JaTkxNV9nZW1fb2JqZWN0X3VucGluX21hcChvYmopOwor
CWlmIChyZXQpCisJCWk5MTVfdm1hX3VucGluKHZtYSk7CiBlcnI6Ci0JaTkxNV9nZW1fb2JqZWN0
X3B1dChvYmopOworCWlmIChyZXQgPT0gLUVERUFETEspIHsKKwkJcmV0ID0gaTkxNV9nZW1fd3df
Y3R4X2JhY2tvZmYoJnd3KTsKKwkJaWYgKCFyZXQpCisJCQlnb3RvIHJldHJ5OworCX0KKwlpOTE1
X2dlbV93d19jdHhfZmluaSgmd3cpOworZXJyX3B1dDoKKwlpZiAocmV0KQorCQlpOTE1X2dlbV9v
YmplY3RfcHV0KG9iaik7CiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4zMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBs
aXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
